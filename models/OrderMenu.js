const Sequelize = require('sequelize');
const Model =Sequelize.Model;
const sequelize = require('../config-db/db');


//实例化数据模板
class OrderMenu extends Model{}


OrderMenu.init({
    // attributes
    ordermenuid:{
        type:Sequelize.INTEGER,
        primaryKey:true,
        allowNull:false,
        autoIncrement: true,        //自增
        unique: true                //要求不能重复
    },
    orderid:{
        type:Sequelize.INTEGER,
        allowNull:false,
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    price: {
        type: Sequelize.DECIMAL(10, 2) ,
        allowNull: false
    },
    picture:{
        type: Sequelize.STRING,
        allowNull: true
    },
    num: {
        type:Sequelize.INTEGER,
        allowNull: false
    },
    createdAt: {
        type: Sequelize.DATE,
        defaultValue:Sequelize.NOW
    },
    updatedAt: {
        type: Sequelize.DATE,
        defaultValue:Sequelize.NOW
    }
},{
    sequelize,
    modelName:'OrderMenu',
    freezeTableName:true,
    timestamps: true
    //options
});
// // //创建表
// OrderMenu.sync({force: false}).then(() => console.log('Order创建成功')).catch(err => console.log(err));

module.exports =OrderMenu;
