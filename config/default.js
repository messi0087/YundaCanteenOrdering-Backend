// default.js


// 设置配置文件
const config = {
    // 启动端口
    port: 5000,

    // 数据库配置
    database: {
        Host:'localhost',
        User:'root',
        Password : '123456',
        Database : 'test'
    },

    //配置需要连接的数据库类型
    dialect:'mysql',

    //配置token的名称
    secretOrKey:'secret',

    //时区配置
    timezone: '+08:00' ,

    //连接池配置
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    },

};

module.exports =config;
