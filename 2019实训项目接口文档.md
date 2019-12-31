# 2019实训项目接口文档

## 1.GetIn.login

说明：用户登录，监测用户登录状态

链接：/login.do

输入参数:

| 意义     | 用户邮箱 | 密码     | 验证码 |
| -------- | -------- | -------- | ------ |
| 名称     | email    | password | code   |
| 数据类型 | String   | String   | String |

返回参数：

| Reason（小写） | 登录成功 | 用户名或密码错误 | 验证码错误 | 用户已登录 |
| -------------- | -------- | ---------------- | ---------- | ---------- |
| success        | 200      | 201              | 202        | 203        |

成功后，设置session

| 意义 | 登录标志 | 用户id | 用户身份 |
| ---- | -------- | ------ | -------- |
| 名称 | islogin  | id     | statues  |
| 值   | true     | String | String   |

## 2.GetIn.register

说明：用户注册接口，成功后通过邮件发送注册链接，用户注册成功后会受到一封激活链接的邮箱

链接：/register.do

参数：

| 意义     | 用户名   | 用户ID（不可修改） | 邮箱   |
| -------- | -------- | ------------------ | ------ |
| 名称     | userName | userId             | email  |
| 数据类型 | String   | String             | String |

| 意义     | 密码     | 重复密码   | 验证码 |
| -------- | -------- | ---------- | ------ |
| 名称     | password | repassword | code   |
| 数据类型 | String   | String     | String |

| 意义     | 部门ID | 部门名称 | 性别   | 身份              |
| -------- | ------ | -------- | ------ | ----------------- |
| 名称     | Did    | Dname    | sex    | statues(默认员工) |
| 数据类型 | String | String   | String | String            |

返回值：

| Reason（小写） | 注册成功 | 邮件未发送 | 用户已经存在 | 验证码错误 | 密码不匹配 |
| -------------- | -------- | ---------- | ------------ | ---------- | ---------- |
| success        | 200      | 201        | 202          | 203        | 204        |

## 3. applicants

说明：申请

链接：/applicant.do

参数：

| 意义     | 用户id | 目的地 | 出发时间 | 预算   |
| -------- | ------ | ------ | -------- | ------ |
| 名称     | id     | Aplace | Atime    | Amoney |
| 数据类型 | String | String | String   | String |

| 意义     | 部门名称 | 原因1    | 紧急   | 原因2   |
| -------- | -------- | -------- | ------ | ------- |
| 名称     | Dname    | Areason1 | Urgent | Areason |
| 数据类型 | String   | String   | String | String  |

| 意义     | 原因2    | 原因3    | 申请标号      |      |
| -------- | -------- | -------- | ------------- | ---- |
| 名称     | Areason2 | Areason3 | Aid(自动生成) |      |
| 数据类型 | String   | String   | String        |      |

返回值

成功：

```json
{"success"：ture}
```

失败：

```json
{"success"：false}
```

## 4 . GetInSys.check

说明：检查输入的验证码是否正确，并修改密码（改进：可以随机生成密码，邮箱发送）~~我太懒不想做~~

链接：/check.do

参数：

| 意思     | 邮箱验证码 | 新密码      | 用户id          |
| -------- | ---------- | ----------- | --------------- |
| 名称     | recode     | newpassword | id(Session获取) |
| 数据类型 | String     | String      | String          |

返回值：

| Reason（小写） | 修改成功 | 修改失败 | 验证码错误 |
| -------------- | -------- | -------- | ---------- |
| success        | 200      | 201      | 202        |

## 5. tools.getcode

说明：获得图片验证码

链接：/getcode.do

参数：无

返回值：图片

## 6. GetIn.logout

说明：用户退出当前账户

链接：/logout.do

参数：从session获取islogin

操作：删除session中的 islogin，id，statues

返回值：无

## 7. 重置密码(GetInSys.reset)

说明：验证邮箱的验证码，并且重置密码

链接：/reset.do

参数：

| 意义     | 用户名   |
| -------- | -------- |
| 名称     | username |
| 数据类型 | String   |

操作：

从数据库中获取邮箱，发送邮件，将验证码和用户名存入session

返回值：

成功：  ` {"success"：200}`

失败：  ` {"success": 201}`

## 8. 更新用户信息

说明：更新数据库中的用户信息

链接：/resetuserinfo.do

参数：

| 意义     | 用户ID            | 用户名   | 性别   |
| -------- | ----------------- | -------- | ------ |
| 名称     | id(从session获取) | username | sex    |
| 数据类型 | String            | String   | String |

| 意义     | 年龄   | 部门ID | 部门名称 |
| -------- | ------ | ------ | -------- |
| 名称     | age    | Did    | Dname    |
| 数据类型 | String | String | String   |

返回值：

成功：  ` {"success"：200}`

失败：  ` {"success": 201}`

## 9. 获得单个用户所有申请	

说明：返回某个用户所有的申请

链接：/userinfoapplicant.do

参数：

| 意义 | 用户ID                |
| ---- | --------------------- |
| 名称 | id                    |
| 备注 | String（session获取） |

返回值：

返回值：

```json
[{
   "Amoney":"12221",
   "Aplace":"??",
   "Urgent":"21212",
    "Atime":"12",
    "Areason2":"121212",
    "Areason1":"1212132",
    "Areason3":"1212121",
    "index":"not",
    "id":"2294458237@qq.com",
    "Aid":"643DA149DF05D59B91510F3C1C145102",
    "Dname":"12121"},
 {
    "Amoney":"12221",
    "Aplace":"shanghai",
    "Urgent":"21212",
    "Atime":"12",
    "Areason2":"121212",
    "Areason1":"1212132",
    "Areason3":"1212121",
    "index":"not",
    "id":"2294458237@qq.com",
    "Aid":"79A9FE28F4ED3A1014FB8CE6A53729B2"
   ,"Dname":"12121"},
 {
     "Amoney":"12221",
     "Aplace":"shanghai",
     "Urgent":"21212",
     "Atime":"12",
     "Areason2":"121212",
     "Areason1":"1212132",
     "Areason3":"1212121",
     "index":"not",
     "id":"2294458237@qq.com",
     "Aid":"7C3C3F70B6AF337AACCA6A0B08780A95",
     "Dname":"12121"}]
```

## 10.  验证邮箱

说明：验证邮箱

链接：/verify.do

参数：

| 意义 | 用户ID          |
| ---- | --------------- |
| 名称 | id              |
| 备注 | 从session中获取 |

返回值：

成功：

```json
{"seccess":200}
```

失败：

```json
{"seccess":201}
```

参数错误：

```json
{"seccess":202}
```

## 11. 用户更新自己信息

链接:/resetuserinfo.do

说明：用户在自己的资料页面更新用户的信息

参数：

| 意义 | 用户ID        | 用户名   | 性别   |
| ---- | ------------- | -------- | ------ |
| 名称 | id            | username | sex    |
| 备注 | 从session获取 | String   | String |

| 意义 | 年龄   | 部门编号 | 部门名称 |
| ---- | ------ | -------- | -------- |
| 名称 | age    | Did      | Dname    |
| 备注 | String | String   | String   |

返回值：

成功

`{"success":200}`

失败：

`{"success":201}`

## 12 . 获取所有的申请信息

链接：/getallapp.do

说明：经理可以获取所有人的所有申请

参数：

无

返回值：

```json
[{
   "Amoney":"12221",
   "Aplace":"??",
   "Urgent":"21212",
    "Atime":"12",
    "Areason2":"121212",
    "Areason1":"1212132",
    "Areason3":"1212121",
    "index":"not",
    "id":"2294458237@qq.com",
    "Aid":"643DA149DF05D59B91510F3C1C145102",
    "Dname":"12121"}]
```

## 13 . 产生财务明细

链接：/getschedule.do

说明：用户从申请中选择一条，填写明细

| 意义 | 用户ID        |
| ---- | ------------- |
| 名称 | id            |
| 备注 | 从session获取 |

## 14 .提交财务明细

链接：/putschedule.do

说明：用户提交财务明细

参数：

| 意义 | 用户id      | 目的地 | 出发时间 | 预算   |
| ---- | ----------- | ------ | -------- | ------ |
| 名称 | id          | Aplace | Atime    | Amoney |
| 备注 | session获取 | String | String   | String |

| 意义 | 部门名称 | 原因1    | 给予   | 原因2   |
| ---- | -------- | -------- | ------ | ------- |
| 名称 | Dname    | Areason1 | isgive | Areason |
| 备注 | String   | String   | 默认n  | String  |

| 意义 | 原因2    | 原因3    | 申请标号    |      |
| ---- | -------- | -------- | ----------- | ---- |
| 名称 | Areason2 | Areason3 | Aid         |      |
| 备注 | String   | String   | session获取 |      |

返回值

成功：

`{"success":200}`

失败:

`{"success":201}`

## 15. 财务审核

链接：/finance.do

GET方式：

说明：返回所有明细

参数:

| 意义 | 身份        |
| ---- | ----------- |
| 名称 | statues     |
| 备注 | session获取 |

返回值：

POST方式：

说明：通过某项明细

参数：

| 意义 | 身份        | 明细编号 |
| ---- | ----------- | -------- |
| 名称 | statues     | Sid      |
| 备注 | session获取 | String   |

返回值：

成功：

`{"success"：200}`

失败：

`{"success":201}`

## 16. 管理员通过申请

链接：/review.do

说明：管理员通过审核

参数：

| 意义 | 身份        | 申请编号 | 状态     |
| ---- | ----------- | -------- | -------- |
| 名称 | statues     | Aid      | indexs   |
| 备注 | session获取 | String   | 通过与否 |

返回值：

| reason  | success | insert error | permission denied | login first |
| ------- | ------- | ------------ | ----------------- | ----------- |
| success | 200     | 201          | 202               | 203         |

## 17.  root管理操做

链接：/user.do

说明：对用户的操作

参数

| 意义 | 操作               | 用户信息 | 用户ID            |
| ---- | ------------------ | -------- | ----------------- |
| 名称 | method             |          | id                |
| 备注 | add/delete/toadmin | 增加传入 | 修改权限/删去传入 |

