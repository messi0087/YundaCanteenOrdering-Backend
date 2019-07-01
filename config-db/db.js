const Sequelize = require('sequelize');
const config = require('../config/default');


//定义连接数据库的参数
const sequelize = new Sequelize(config.database.Database, config.database.User, config.database.Password, {
    host: config.database.Host,
    dialect: config.dialect,

    // // 不展示进行SQL语句的查询
    // logging: false,

    //配置连接池
    pool: config.pool,

    //东八时区,数据库的时间设置
    timezone: config.timezone ,

    // // SQLite only
    // storage: 'path/to/database.sqlite'
});

// //执行连接数据库
// sequelize
//     .authenticate()
//     .then(function(err) {
//         console.log('Connection has been established successfully.');
//     })
//     .catch(function (err) {
//         console.log('Unable to connect to the database:', err);
//     });

module.exports =sequelize;

