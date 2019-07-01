const Sequelize = require('sequelize');
const Model =Sequelize.Model;
const sequelize = require('../config-db/db');


//实例化数据模板
class Order extends Model{}


Order.init({
    // attributes
    orderid:{
        type:Sequelize.INTEGER,
        primaryKey:true,
        allowNull:false,
        autoIncrement: true,
    },
    accountMoney:{
        type:Sequelize.INTEGER,
        allowNull:false,
    },
    packing: {
        type: Sequelize.STRING,
        allowNull: false
    },
    condition: {
        type: Sequelize.STRING,
        allowNull: false
    },
    date:{
        type: Sequelize.STRING,
        allowNull: true
    },
    storeid: {
        type:Sequelize.INTEGER,
        allowNull: false
    },
    userid:{
        type:Sequelize.INTEGER,
        allowNull:false,
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
    modelName:'Order',
    freezeTableName:true,
    timestamps: true
    //options
});// // //创建表
// Order.sync({force: true}).then(() => console.log('Order创建成功')).catch(err => console.log(err));


module.exports =Order;
