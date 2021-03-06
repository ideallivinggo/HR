package com.aaa.rzhr.filter;

import com.aaa.rzhr.service.PermissionService;
import com.aaa.rzhr.util.SpringContextUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Set;

@SuppressWarnings("ALL")
public class  URLPathMatchingFilter extends PathMatchingFilter {
    @Autowired
    PermissionService permissionService;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue)
            throws Exception {
        if(null==permissionService){
            permissionService = SpringContextUtils.getContext().getBean(PermissionService.class);
        }
        String requestURI = getPathWithinApplication(request);

        System.out.println("requestURI:" + requestURI);
    /////3、得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）
        Subject subject = SecurityUtils.getSubject();
      //  System.out.println( "--------------"+subject.getPrincipal().toString());
        // 如果没有登录，就跳转到登录页面
        if (!subject.isAuthenticated()) {
        WebUtils.issueRedirect(request, response, "/login");
            return false;
        }

        // 看看这个路径权限里有没有维护，如果没有维护，一律放行(也可以改为一律不放行)
        boolean needInterceptor = permissionService.needInterceptor(requestURI);
        if (!needInterceptor) {

            System.out.println("没有这个路径");
          /*  if(requestURI.equals("/home")){
                return true;
            }else{
                WebUtils.issueRedirect(request, response, "/login");
                return false;
            }*/
               return true;

        } else {
            boolean hasPermission = false;
            String userName = subject.getPrincipal().toString();
            Set<String> permissionUrls = permissionService.listPermissionURLs(userName);

            for (String url : permissionUrls) {
                // 这就表示当前用户有这个权限
                if (url.equals(requestURI)) {
                    hasPermission = true;
                    break;
                }
            }

            if (hasPermission){
                return true;}
            else {
                 ///未授权异常
                UnauthorizedException ex = new UnauthorizedException("当前用户没有访问路径 " + requestURI + " 的权限");

                subject.getSession().setAttribute("ex", ex);
                   //权限不足跳转页面
                WebUtils.issueRedirect(request, response, "/unauthorized");
                return false;
            }

        }

    }
}