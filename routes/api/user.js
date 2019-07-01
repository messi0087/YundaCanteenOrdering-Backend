const Router = require('koa-router');
const tools = require('../../handle/tools');
const bcrypt = require('bcryptjs');
const jwt =require('jsonwebtoken');
const config = require('../../config/default');
const passport =require('koa-passport');

//路由生成
const router = new Router();
//引入 User模型
const User = require('../../models/User');






/**
 * @route GET api/user/test
 * @desc 测试接口地址
 * @access 接口是公开的
 */
router.get("/test",async ctx =>{
    ctx.status = 200;
    ctx.body = { msg:'user works...'};
});



/**
 * @route POST api/user/register
 * @desc 注册接口地址
 * @access 接口是公开的
 */
router.post("/register",async ctx =>{

    /*测 ------------------------ 试*/
    // console.log(ctx.request.body);
    const findResult = await User.findAll({
        where: {
            email: ctx.request.body.email
        }
    });
    //测试查询是否成功
    // console.log(findResult);
    if( findResult.length > 0 ){
        ctx.status = 401;
        ctx.body = { message:'邮箱已经被占用'};
    }else{

        //配置返回报文
        ctx.status = 200;
        ctx.body ={ message:'注册成功' };
        //没查到存入新对象中
        const newUser = {
            name: ctx.request.body.name,
            email: ctx.request.body.email,
            password: tools.enbcrypt(ctx.request.body.password),
            avatar: ctx.request.body.avatar,
        };

        //将新对象存入数据库中
        await User.create({...newUser}).catch(err =>{
            console.log( err )
        });



    }

});



/**
 * @route POST api/user/login
 * @desc 登陆接口地址 返回token
 * @access 接口是公开的
 */
router.post("/login",async ctx =>{
    //查询
    const findResult = await User.findAll({
        where: { email: ctx.request.body.email }
    });
    const user = findResult[0];
    const password = ctx.request.body.password;


    //判断查没查到
    if ( findResult.length === 0 ){
        ctx.status = 404;
        ctx.body ={ message:'用户不存在!' }
    }else {
        //查到后 验证密码
        const result = await bcrypt.compareSync(password, user.password);

        //验证通过 返回token
        const payload = {id: user.id , name : user.name};
        // console.log(payload);
        const token = jwt.sign( payload, config.secretOrKey ,{ expiresIn : 60*60});

        if(result){
            ctx.status =200;
            ctx.body ={ success : true, token:'Bearer ' + token , userid: user.id};
        }else {
            ctx.status = 401;
            ctx.body ={ message : '密码错误' };
        }
    }
});



/**
 * @route GET api/user/current
 * @desc 用户信息接口地址 返回用户信息
 * @access 接口是私密的
 */
router.get('/current',passport.authenticate('jwt', { session: false }) ,async ctx =>{
    ctx.status= 200;
    ctx.body = {
        id : ctx.state.user[0].id,
        email : ctx.state.user[0].email,
        name : ctx.state.user[0].name,
    }
});



/**
 * @route POST api/user/change
 * @desc 用户信息接口地址 返回用户信息
 * @access 接口是公开的
 */
router.post('/change',async ctx =>{
    //查询
    const findResult = await User.findAll({
        where: { email: ctx.request.body.email }
    });
    //存入查询的用户
    const user = findResult[0];
    //存入原密码
    const password = ctx.request.body.password;
    //存入现在的密码
    const changePassword = tools.enbcrypt(ctx.request.body.changePassword);


    //判断查没查到
    if ( findResult.length === 0 ){
        ctx.status = 404;
        ctx.body ={ message:'用户不存在!' }
    }else {
        //查到后 验证密码
        const result = await bcrypt.compareSync(password, user.password);
        if(result){
            //查询并且修改密码
           User.update({
                password:changePassword
            },{
                where:{
                    email: user.email
                }
            }).catch(error =>console.log(error.message));
           //配置返回的报文
            ctx.status = 200 ;
            ctx.body = {email : user.email,message: '密码更改成功'};
        }else {
            ctx.status = 401;
            ctx.body ={ message : '密码错误' };
        }
    }
});




module.exports = router.routes();
