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
module openurp.base.code.model;

import beangle.commons.entity.pdo;
import beangle.commons.entity.entity;
/**
 * 国家地区
 */
@Code(category="nation")
class Country :BaseCode!uint{
    
}

/**
 * 行政区划
 */
@Code(category="nation")
class Division :BaseCode!uint,Hierarchical!Division{
    mixin HierarchicalBean!Division;
}

/**
 * 性别
 */
@Code(category="nation")
class Gender:BaseCode!uint{
    
}

/**
 * 语种
 */
@Code(category="nation")
class Language:BaseCode!uint{
    
}

/**
 * 科研机构
 */
@Code(category="ministry")
class Institution :BaseCode!uint{
    
}

/**
 * 身份证类型
 */
@Code(category="industry")
class IdcardType :BaseCode!uint{

}