package com.aaa.rzhr.config;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;

import java.lang.reflect.Method;
import java.time.Duration;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;


@Configuration
@EnableCaching
//Redis 缓存配置类
public class RedisConfig extends CachingConfigurerSupport {
    @Bean
    public CacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
        return new RedisCacheManager(
                RedisCacheWriter.nonLockingRedisCacheWriter(redisConnectionFactory),
                this.getRedisCacheConfigurationWithTtl(30*60), // 默认策略，未配置的 key 会使用这个
                this.getRedisCacheConfigurationMap() // 指定 key 策略
        );
    }

    private Map<String, RedisCacheConfiguration> getRedisCacheConfigurationMap() {
        Map<String, RedisCacheConfiguration> redisCacheConfigurationMap = new HashMap<>();
        //SsoCache和BasicDataCache进行过期时间配置
        redisCacheConfigurationMap.put("SsoCache", this.getRedisCacheConfigurationWithTtl(3*60));
        redisCacheConfigurationMap.put("BasicDataCache", this.getRedisCacheConfigurationWithTtl(1*60));
        return redisCacheConfigurationMap;
    }

    private RedisCacheConfiguration getRedisCacheConfigurationWithTtl(Integer seconds) {
        //序列化数据
        Jackson2JsonRedisSerializer<Object> jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer<>(Object.class);

       //ObjectMapper类是Jackson库的主要类。它提供一些功能将转换成Java对象匹配JSON结构，反之亦然。它使用JsonParser和JsonGenerator的实例实现JSON实际的读/写。
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);

        RedisCacheConfiguration redisCacheConfiguration = RedisCacheConfiguration.defaultCacheConfig();
        redisCacheConfiguration = redisCacheConfiguration.serializeValuesWith(
                RedisSerializationContext
                        .SerializationPair
                        .fromSerializer(jackson2JsonRedisSerializer)
        ).entryTtl(Duration.ofSeconds(seconds));

        return redisCacheConfiguration;
    }
//根据参数查找缓存
    @Bean
    public KeyGenerator wiselyKeyGenerator() {
        return new KeyGenerator() {

            public Object generate(Object target, Method method, Object... params) {
                StringBuilder sb = new StringBuilder();
                sb.append(target.getClass().getName());
                sb.append("." + method.getName());
                if(params==null||params.length==0||params[0]==null){
                    return null;
                }
                String join = String.join("&", Arrays.stream(params).map(Object::toString).collect(Collectors.toList()));
                String format = String.format("%s{%s}", sb.toString(), join);
                //log.info("缓存key：" + format);
                return format;
            }
        };
    }


}
