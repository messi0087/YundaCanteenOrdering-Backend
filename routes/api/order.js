const Router = require('koa-router');
const config = require('../../config/default');

//路由生成
const router = new Router();
//引入Menu模型
const Order = require('../../models/Order');
const OrderMenu = require('../../models/OrderMenu');
const Store = require('../../models/Store');


// Order.belongsTo(User, {foreignKey: 'userid'}); // 为User 添加fk_company 外键
// OrderMenu.belongsTo(Order, {foreignKey: 'orderid'}); // 为User 添加fk_company 外键
// OrderMenu.belongsTo(Menu, {foreignKey: 'menuid'}); // 为User 添加fk_company 外键
/**
 * @route GET api/order/test
 * @desc 测试接口地址
 * @access 接口是公开的
 */
router.get("/test",async ctx =>{
    ctx.status = 200;
    ctx.body = {message: '测试成功'};
});

/**
 * @route POST api/order/creatOrder
 * @desc 创建订单的请求
 * @access 接口是公开的
 */
router.post('/creatOrder',async ctx =>{

    const newOrder = {
        accountMoney: ctx.request.body.accountMoney,
        packing: ctx.request.body.packing,
        condition: ctx.request.body.condition,
        date: ctx.request.body.date,
        userid:ctx.request.body.userid,
        storeid:ctx.request.body.storeid,
    };

    await Order.create({...newOrder}).then(response=>{
        // console.log(response.orderid);
        ctx.status = 200;
        ctx.body ={message:'Order增加成功',orderid:response.orderid};
    }).catch(function(err){
        console.log('inserted Order error');
        ctx.status = 400;
        ctx.body ={message:err.message};
    });

});




/**
 * @route POST api/order/orderMenu
 * @desc 获取菜单数据的请求
 * @access 接口是公开的
 */
router.post('/orderMenu', ctx =>{

    const orderid =ctx.request.body.orderid;
    ctx.request.body.menuData.map(item=>{
        const newOrder = {
            orderid: orderid,
            name: item.name,
            price: item.price,
            picture: item.picture,
            num:item.num
        };

        OrderMenu.create({...newOrder}).then(()=>{
        }).catch(function(err){
            ctx.status = 400;
            ctx.body ={message:err.message};
        });
    });
    ctx.status = 200;
    ctx.body ={message:'订单已完成'};

});






/**
 * @route POST api/order/getOrder
 * @desc 获取订单数据
 * @access 接口是公开的
 */
router.post('/getOrder', async ctx =>{

    let arr =[];
    const userid =ctx.request.body.userid;

//查询数据
const findResult = await Order.findAll({
    attributes: ['accountMoney','storeid','createdAt',],
    where: {
        userid:userid
    }
});

//检测查询数据成功
if(findResult.length > 0) {
    //将数据转换为JSON 字符串
    const menuList = JSON.stringify(findResult);
    //将Json数据转化为：JSON.parse() 方法将数据转换为 JavaScript 对象。
    ctx.body=JSON.parse(menuList)

}else {
    //如果没有查询到数据的话
    ctx.status = 404;
    ctx.body ={message: '用户没有订单'}
}
});





/**
 * @route POST api/order/getStore
 * @desc 获取订单数据
 * @access 接口是公开的
 */
router.post('/getStore', async ctx =>{

    const storeid =ctx.request.body.storeid;

//查询数据
    const findResult = await Store.findAll({
        attributes: ['picture','name','location'],
        where: {
            storeid:storeid
        }
    });

//检测查询数据成功
    if(findResult.length > 0) {
        //将数据转换为JSON 字符串
        const menuList = JSON.stringify(findResult);
        //将Json数据转化为：JSON.parse() 方法将数据转换为 JavaScript 对象。
        ctx.body=JSON.parse(menuList)

    }else {
        //如果没有查询到数据的话
        ctx.status = 404;
        ctx.body ={message: '用户没有订单'}
    }
});




module.exports = router.routes();
