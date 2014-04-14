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
module openurp.base.org.model;

import beangle.commons.entity.entity;

/**
 * 学校
 */
interface School : Coded,Entity!ulong{
    @property string name();
}

/**
 * 银行账户
 */
struct BankAccount{
    string account;
    string bank;
}

/**
 * 部门
 */
interface Department: Entity!uint, Hierarchical!Department{
    @property bool teaching();
}
