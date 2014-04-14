/*
 * OpenURP, Open University Resourse Planning Program
 *
 * Copyright (c) 2013-2014, OpenURP Software.
 *
 * OpenURP is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OpenURP is distributed in the hope that it will be useful.
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OpenURP.  If not, see <http://www.gnu.org/licenses/>.
 */
module openurp.base.org.bean;

import openurp.base.org.model;
import beangle.commons.entity.pdo;
import std.typecons;

/**
 * 部门信息
 */
class DepartmentBean:IdObject!uint,Department{
    mixin CodedBean;
    mixin HierarchicalBean!Department;
    
    /** 是否开课*/
    private bool _teaching;
    
    @property bool teaching() {
        return _teaching;
    }
    
    @property void teaching(bool newTeaching){
        _teaching = newTeaching;
    }
}
