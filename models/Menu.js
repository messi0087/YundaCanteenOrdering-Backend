const Sequelize = require('sequelize');
const Model =Sequelize.Model;
const sequelize = require('../config-db/db');


//实例化数据模板
class Menu extends Model{}


Menu.init({
    // attributes
    menuid:{
        type:Sequelize.INTEGER,
        primaryKey:true,
        allowNull:false,
        autoIncrement: true,
        // defaultValue:Sequelize.UUIDV1
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
    createdAt: {
        type: Sequelize.DATE,
        defaultValue:Sequelize.NOW
    },
    updatedAt: {
        type: Sequelize.DATE,
        defaultValue:Sequelize.NOW
    },
    num: {
        type:Sequelize.INTEGER,
        allowNull: true
    }
},{
    sequelize,
    modelName:'Menu',
    freezeTableName:true,
    timestamps: true
    //options
});
//

// //创建表
// Menu.sync({force: true}).then(() => console.log('SUCCESS CREATE TABLE USER')).catch(err => console.log(err));


// // 创建关联增加数据
// User.sync({ force: true }).then(() => {
//     // Now the `users` table in the database corresponds to the model definition
//     return User.create({
//         name: 'Johsns',
//         email: 'Hancoscks@123',
//         password:'a11s2',
//     });
// });


module.exports =Menu;
