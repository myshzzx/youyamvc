
package com.magicalcoder.youyamvc.app.teacher.service.impl;

import com.magicalcoder.youyamvc.app.teacher.dao.TeacherDao;
import com.magicalcoder.youyamvc.app.teacher.service.TeacherService;
import com.magicalcoder.youyamvc.app.model.Teacher;
import org.springframework.stereotype.Component;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.magicalcoder.youyamvc.core.common.utils.copy.CopyerSpringUtil;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by www.magicalcoder.com
* 如果你改变了此类 read 请将此行删除
* 799374340@qq.com
*/
@Component("teacherService")
public class TeacherServiceImpl implements TeacherService{
    @Resource(name="teacherDao")
    private TeacherDao teacherDao;


    @Override
    public Teacher getTeacher(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        return teacherDao.getTeacher(query);
    }

    @Override
    public Teacher selectOneTeacherWillThrowException(Map<String, Object> query){
        return teacherDao.getTeacher(query);
    }

    @Override
    public List<Teacher> getTeacherList(Map<String, Object> query) {
        return teacherDao.getTeacherList(query);
    }

    @Override
    public Integer getTeacherListCount(Map<String, Object> query) {
        return teacherDao.getTeacherListCount(query);
    }

    @Override
    public     Long  insertTeacher(Teacher entity) {
        return teacherDao.insertTeacher(entity);
    }

    @Override
    public void updateTeacher(Teacher entity) {
        //校验
        teacherDao.updateTeacher(entity);
    }

    @Override
    public void updateTeacherByWhereSql(Map<String,Object> entity,String whereSql) {
        if(entity==null ||entity.isEmpty()){
            throw new RuntimeException("entity不能为空");
        }
        if(StringUtils.isBlank(whereSql)){
            throw new RuntimeException("whereSql不能为空");
        }
        entity.put("whereSql",whereSql);
        //校验
        teacherDao.updateTeacherByWhereSql(entity);
    }

    @Override
    public void deleteTeacher(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        teacherDao.deleteTeacher(query);
    }
    @Override
    public void deleteTeacherList(Map<String,Object> entity){
        teacherDao.deleteTeacher(entity);
    }

    @Override
    public void deleteTeacherByWhereSql(String whereSql) {
        if(StringUtils.isBlank(whereSql)){
            throw new RuntimeException("whereSql不能为空");
        }
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("whereSql", whereSql);
        teacherDao.deleteTeacherByWhereSql(query);
    }


    @Override
    public void truncateTeacher() {
        teacherDao.truncateTeacher();
    }

    @Override
    public void batchInsertTeacher(List<Teacher> list) {
        //校验
        teacherDao.batchInsertTeacher(list);
    }

    @Override
    public void batchUpdateTeacher(List<Teacher> list) {
        //校验
        teacherDao.batchUpdateTeacher(list);
    }
    @Override
    public void batchDeleteTeacher(List<Long> idList) {
        teacherDao.batchDeleteTeacher(idList);
    }

    @Override
    public void batchDeleteTeacherList(List<Teacher> entityList){
        teacherDao.batchDeleteTeacherList(entityList);
    }

    @Transactional
    @Override
    public void transactionImportJsonList(List<Teacher> list) {
        if(list!=null && list.size()>0){
            for(Teacher teacher : list){
                if (teacher.getId() == null) {
                    insertTeacher(teacher);
                } else {
                    Teacher entity = getTeacher(teacher.getId());
                    if(entity==null){
                        insertTeacher(teacher);
                    }else {
                        CopyerSpringUtil.copyProperties(teacher, entity);
                        updateTeacher(entity);
                    }
                }
            }
        }
    }

}
