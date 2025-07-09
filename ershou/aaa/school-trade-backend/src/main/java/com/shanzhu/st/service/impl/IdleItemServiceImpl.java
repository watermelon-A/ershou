package com.shanzhu.st.service.impl;

import com.shanzhu.st.entity.IdleItem;
import com.shanzhu.st.entity.User;
import com.shanzhu.st.mapper.IdleItemMapper;
import com.shanzhu.st.mapper.UserMapper;
import com.shanzhu.st.service.IdleItemService;
import com.shanzhu.st.vo.PageVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class IdleItemServiceImpl implements IdleItemService {

    @Resource
    private IdleItemMapper idleItemMapper;

    @Resource
    private UserMapper userMapper;

    public boolean addIdleItem(IdleItem idleItem) {
        return idleItemMapper.insert(idleItem) == 1;
    }

    public IdleItem getIdleItem(Long id) {
        IdleItem idleItem = idleItemMapper.selectByPrimaryKey(id);
        if (idleItem != null) {
            idleItem.setUser(userMapper.selectByPrimaryKey(idleItem.getUserId()));
        }
        return idleItem;
    }

    public List<IdleItem> getAllIdelItem(Long userId) {
        return idleItemMapper.getAllIdleItem(userId);
    }

    public PageVo<IdleItem> findIdleItem(String findValue, int page, int nums) {
        List<IdleItem> list = idleItemMapper.findIdleItem(findValue, (page - 1) * nums, nums);
        if (list.size() > 0) {
            List<Long> idList = new ArrayList<>();
            for (IdleItem i : list) {
                idList.add(i.getUserId());
            }
            List<User> userList = userMapper.findUserByList(idList);
            Map<Long, User> map = new HashMap<>();
            for (User user : userList) {
                map.put(user.getId(), user);
            }
            for (IdleItem i : list) {
                i.setUser(map.get(i.getUserId()));
            }
        }
        int count = idleItemMapper.countIdleItem(findValue);
        return new PageVo<>(list, count);
    }

    public PageVo<IdleItem> findIdleItemByLable(int idleLabel, int page, int nums) {
        List<IdleItem> list = idleItemMapper.findIdleItemByLable(idleLabel, (page - 1) * nums, nums);
        if (list.size() > 0) {
            List<Long> idList = new ArrayList<>();
            for (IdleItem i : list) {
                idList.add(i.getUserId());
            }
            List<User> userList = userMapper.findUserByList(idList);
            Map<Long, User> map = new HashMap<>();
            for (User user : userList) {
                map.put(user.getId(), user);
            }
            for (IdleItem i : list) {
                i.setUser(map.get(i.getUserId()));
            }
        }
        int count = idleItemMapper.countIdleItemByLable(idleLabel);
        return new PageVo<>(list, count);
    }

    public boolean updateIdleItem(IdleItem idleItem) {
        return idleItemMapper.updateByPrimaryKeySelective(idleItem) == 1;
    }

    public PageVo<IdleItem> adminGetIdleList(int status, int page, int nums) {
        List<IdleItem> list = idleItemMapper.getIdleItemByStatus(status, (page - 1) * nums, nums);
        if (list.size() > 0) {
            List<Long> idList = new ArrayList<>();
            for (IdleItem i : list) {
                idList.add(i.getUserId());
            }
            List<User> userList = userMapper.findUserByList(idList);
            Map<Long, User> map = new HashMap<>();
            for (User user : userList) {
                map.put(user.getId(), user);
            }
            for (IdleItem i : list) {
                i.setUser(map.get(i.getUserId()));
            }
        }
        int count = idleItemMapper.countIdleItemByStatus(status);
        return new PageVo<>(list, count);
    }

}
