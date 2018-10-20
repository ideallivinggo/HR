package com.aaa.rzhr.realm;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.service.EmpService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

@SuppressWarnings("ALL")
public class DatabaseRealm extends AuthorizingRealm {

    @Autowired
    EmpService empService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("---------------------------------------------------------------");
        UsernamePasswordToken t= (UsernamePasswordToken) token;
        String empName=token.getPrincipal().toString();
        Emp emp= empService.getByName(empName);
        String passwordDB=emp.getPassword();
        String salt=emp.getSalt();
        SimpleAuthenticationInfo a=
                new SimpleAuthenticationInfo(empName,passwordDB,
                        ByteSource.Util.bytes(salt),getName());
        return a;
    }
}
