package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Menu;
import com.aaa.rzhr.pojo.Permission;
import java.util.List;

/**
 * @author XBJ
 * @date 2018-10-20 18:22
 */
public interface PermissionMenuService {
    List<Permission> getAllMenuByMenu(Menu menu);

}
