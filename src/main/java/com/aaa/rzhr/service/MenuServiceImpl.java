package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.MenuMapper;
import com.aaa.rzhr.pojo.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author XBJ
 * @date 2018-10-20 17:43
 */
@SuppressWarnings("ALL")
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuMapper menuMapper;

    @Override
    public List<Menu> getallMenu() {
        List<Menu> menus = menuMapper.getallMenu();

        return menus;
    }
}
