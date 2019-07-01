const Router = require('koa-router');
const config = require('../../config/default');

//路由生成
const router = new Router();
//引入Menu模型
const Menu = require('../../models/Menu');

//引入Store模型
const Store = require('../../models/Store');
//引入对于数组去重的使用
const Arraydeal = require('../../handle/Arraydeal');

//引入sequelize的复杂查询公式
const Sequelize = require('sequelize');
const Op = Sequelize.Op;


/**
 * @route GET api/menu/test
 * @desc 测试接口地址
 * @access 接口是公开的
 */
router.get("/test",async ctx =>{
    ctx.status = 200;
    ctx.body = {message: '测试成功'};
});



/**
 * @route GET api/menu/storeData
 * @desc 获取饭店数据的请求
 * @access 接口是公开的
 */
router.get('/storeData',async ctx =>{;
    //查询数据
    const findResult = await Store.findAll({
        // attributes: ['name','storeid','picture','num','menuid','menuTypeid','storeid'],
        attributes: ['name','storeid','picture','location','describe']
    });

    //检测查询数据成功
    if(findResult.length > 0) {
        //将数据转换为JSON 字符串
        const storeData = JSON.stringify(findResult);
        //将Json数据转化为：JSON.parse() 方法将数据转换为 JavaScript 对象。
        //返回的数据
        ctx.status = 200;
        ctx.body =JSON.parse(storeData);
    }else {
        //如果没有查询到数据的话
        ctx.status = 404;
        ctx.body ={message: '没有被选中的菜品'}
    }
});





/**
 * @route POST api/menu/menuList
 * @desc 注册获取菜单项数据地址
 * @access 接口是公开的
 */
router.post('/menuList',async ctx =>{
    // console.log(ctx.request.body.key);
    //查询数据
    const findResult = await Menu.findAll({
        // attributes: ['menuid', 'name','price','picture','menuTypeid'],
        attributes: ['menuTypeid'],
        where: {
            storeid: ctx.request.body.key
        }
    });

    //检测查询数据成功
    if(findResult.length > 0) {
        //将数据转换为JSON 字符串
        const menuList = JSON.stringify(findResult);
        //将Json数据转化为：JSON.parse() 方法将数据转换为 JavaScript 对象。
        //返回的数据
        ctx.status = 200;
        ctx.body = Arraydeal(JSON.parse(menuList));
    }else {
        //如果没有查询到数据的话
        ctx.status = 404;
        ctx.body ={message: '数据没有查询到'}
    }
});



/**
 * @route POST api/menu/menuOption
 * @desc 注册获取具体菜单的地址
 * @access 接口是公开的
 */
router.post('/menuOption',async ctx =>{

    //查询数据
    const findResult = await Menu.findAll({
        // attributes: ['menuid', 'name','price','picture','menuTypeid'],
        attributes: ['name','price','picture','menuid','num'],
        where: {
            menuTypeid:ctx.request.body.menuTypeid,
            storeid: ctx.request.body.storeid
        }
    });

    //检测查询数据成功
    if(findResult.length > 0) {
        //将数据转换为JSON 字符串
        const menuList = JSON.stringify(findResult);
        //将Json数据转化为：JSON.parse() 方法将数据转换为 JavaScript 对象。
        //返回的数据
        ctx.status = 200;
        ctx.body =JSON.parse(menuList);
        console.log(ctx.body);
    }else {
        //如果没有查询到数据的话
        ctx.status = 404;
        ctx.body ={message: '数据没有查询到'}
    }
});


/**
 * @route POST api/menu/shoppingCart
 * @desc 获取购物车数据的请求
 * @access 接口是公开的
 */
router.post('/shoppingCart',async ctx =>{
    // console.log(ctx.request.body.key);
    //查询数据
    const findResult = await Menu.findAll({
        // attributes: ['menuid', 'name','price','picture','menuTypeid'],
        attributes: ['name','price','picture','num','menuid','menuTypeid','storeid'],
        where: {
            num: { [Op.gt] :  0 },
            storeid:ctx.request.body.key
        }
    });

    //检测查询数据成功
    if(findResult.length > 0) {
        //将数据转换为JSON 字符串
        const menuList = JSON.stringify(findResult);
        //将Json数据转化为：JSON.parse() 方法将数据转换为 JavaScript 对象。
        //返回的数据
        ctx.status = 200;
        ctx.body =JSON.parse(menuList);
    }else {
        //如果没有查询到数据的话
        ctx.status = 404;
        ctx.body ={message: '没有被选中的菜品'}
    }
});



/**
 * @route POST api/menu/shoppingMoney
 * @desc 获取花费的钱的请求
 * @access 接口是公开的
 */
router.post('/shoppingMoney',async ctx =>{

    //查询数据
    const findResult = await Menu.findAll({
        attributes: [[Sequelize.literal('SUM(num * price)'), 'money']],
        where: {
            storeid: ctx.request.body.storeid
        }
    });

    //检测查询数据成功
    if(findResult.length > 0) {
        //将数据转换为JSON 字符串
        const menuList = JSON.stringify(findResult);
        //将Json数据转化为：JSON.parse() 方法将数据转换为 JavaScript 对象。
        //返回的数据
        ctx.status = 200;
        ctx.body =JSON.parse(menuList);
    }else {
        //如果没有查询到数据的话
        ctx.status = 404;
        ctx.body ={message: '没有被选中的菜品'}
    }
});


/**
 * @route POST api/menu/menuAdd
 * @desc 创建订单的请求
 * @access 接口是公开的
 */
router.post('/menuChange',async ctx =>{

    const newnum = ctx.request.body.num;
    const menuid =ctx.request.body.menuid;
    // 改变菜品的数量
    const changeResult = await Menu.update({
        num:newnum
    },{
        where:{
            menuid:menuid,
        }
    }).catch(error =>console.log(error.message));

    //修改数据成功
    if(changeResult!== 0) {
        //查询数据
        const findResult = await Menu.findAll({
            // attributes: ['menuid', 'name','price','picture','menuTypeid'],
            attributes: ['storeid','menuTypeid'],
            where: {
                menuid: menuid,
            }
        });

        //检测查询数据成功
        if (findResult.length > 0) {
            //将数据转换为JSON 字符串
            const menuList = JSON.stringify(findResult);
            //将Json数据转化为：JSON.parse() 方法将数据转换为 JavaScript 对象。
            //返回的数据
            ctx.status = 200;
            ctx.body = JSON.parse(menuList);
        } else {
            //如果没有查询到数据的话
            ctx.status = 404;
            ctx.body = {message: '数据没有查询到'}
        }
    }else{
        //没有修改成功的话
        ctx.status = 404;
        ctx.body = {message: '数据没有修改成功'}
    }
});



/**
 * @route POST api/menu/clearMenu
 * @desc 创建订单的请求
 * @access 接口是公开的
 */
router.post('/clearMenu',async ctx =>{
    const storeid =ctx.request.body.storeid;
    // 改变菜品的数量
    const changeResult = await Menu.update({
        num:0
    },{
        where:{
            storeid:storeid,
        }
    }).catch(error =>console.log(error.message));

    // console.log(changeResult[0]);
    //修改数据成功
    if(changeResult[0]!== 0) {
            ctx.status = 200;
            ctx.body = { message:'成功清除购物车'};
        }else {
            //如果没有查询到数据的话
            ctx.status = 404;
            ctx.body = { message: '购物车清空失败'}
        }
});



module.exports = router.routes();
