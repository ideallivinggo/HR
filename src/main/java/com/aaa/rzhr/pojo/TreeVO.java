package com.aaa.rzhr.pojo;

import java.util.List;

/**
 * @author XBJ
 * @date 2018-10-14 17:44
 */
@SuppressWarnings("ALL")
public class TreeVO {
    private String name;
    private List<Permission>  permissionList;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Permission> getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(List<Permission> permissionList) {
        this.permissionList = permissionList;
    }

    @Override
    public String toString() {
        return "TreeVO{" +
                "name='" + name + '\'' +
                ", permissionList=" + permissionList +
                '}';
    }
}
