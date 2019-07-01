const Sequelize = require('sequelize');
const Model =Sequelize.Model;
const sequelize = require('../config-db/db');
//引入菜品建立关系


//实例化数据模板
class Store extends Model{}


Store.init({
    // attributes
    storeid:{
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
    picture:{
        type: Sequelize.STRING,
        allowNull: true
    },
    location:{
        type: Sequelize.STRING,
        allowNull: false
    },
    describe:{
        type: Sequelize.STRING,
        allowNull: false
    },
    createdAt: {
        type: Sequelize.DATE,
        defaultValue:Sequelize.NOW
    },
    updatedAt: {
        type: Sequelize.DATE,
        defaultValue:Sequelize.NOW
    },
},{
    sequelize,
    modelName:'Store',
    freezeTableName:true,
    timestamps: true
    //options
});
//

// //创建表
// Store.sync({force: true}).then(() => console.log('SUCCESS CREATE TABLE USER')).catch(err => console.log(err));
// // 创建关联增加数据
// User.sync({ force: true }).then(() => {
//     // Now the `users` table in the database corresponds to the model definition
//     return User.create({
//         name: 'Johsns',
//         email: 'Hancoscks@123',
//         password:'a11s2',
//     });
// });

// Store.create({
//     name:'菊花过桥米线',
// });


module.exports =Store;
