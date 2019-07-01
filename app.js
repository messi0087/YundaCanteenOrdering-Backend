const koa = require('koa');
const Router = require('koa-router');
//引入配置文件
const config = require('./config/default');
//映入post请求可获取数据
const bodyParser = require('koa-bodyparser');
//引入数据库配置
const sequelize = require('./config-db/db');
//引入token验证
const passport = require('koa-passport');
//引入api
const user = require('./routes/api/user');
//引入api
const menu = require('./routes/api/menu');
//引入api
const order = require('./routes/api/order');
//引入跨域请求
const cors = require('koa2-cors');

//实例化koa
const app = new koa();

//允许跨域
app.use(cors());
//跨域请求的设置
// app.use(cors({
//     origin: function (ctx) {
//         if (ctx.url === '/a') {
//             return "*"; // 允许来自所有域名请求
//         }
//         return 'http://localhost:3000'; // 这样就能只允许 http://localhost:8080 这个域名的请求了
//     },
//     exposeHeaders: ['WWW-Authenticate', 'Server-Authorization'],
//     maxAge: 5,
//     credentials: true,
//     allowMethods: ['GET', 'POST', 'DELETE'],
//     allowHeaders: ['Content-Type', 'Authorization', 'Accept'],
// }));

//声明路由
const router = new Router();

//配置路由
app.use(bodyParser());
app.use(router.routes()).use(router.allowedMethods());

// 路由test
router.get("/test",async ctx=>{
    ctx.body ={ msg:"Hello Koa Interfaces"};
});

//确认数据库是否成功
// //执行连接数据库
sequelize
    .authenticate()
    .then(function(err) {
        console.log('The Database is connected , database is ' + config.database.Database);
    })
    .catch(function (err) {
        console.log('Unable to connect to the database:', err);
    });


// passport的初始化
app.use( passport.initialize() );
app.use( passport.session() );


//回调到config文件中 passport.js
require('./config-passport/passport')(passport);


// 配置路由地址 localhost:port/api/user
router.use('/api/user',user);

// 配置路由地址 localhost:port/api/menu
router.use('/api/menu',menu);

// 配置路由地址 localhost:port/api/order
router.use('/api/order',order);


//配置端口
const port =process.env.PORT || config.port;

//端口监听
app.listen(port,() =>{
    console.log(`server started on ${port}`);
});


