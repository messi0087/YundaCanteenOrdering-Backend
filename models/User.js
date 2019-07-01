const Sequelize = require('sequelize');
const Model =Sequelize.Model;
const sequelize = require('../config-db/db');


//实例化数据模板


class User extends Model{}
User.init({
    // attributes
    id:{
        type:Sequelize.INTEGER,
        primaryKey:true,            //主键
        allowNull:false,            //不允许空
        autoIncrement: true,        //自增
        unique: true                //要求不能重复
        // defaultValue:Sequelize.UUIDV1
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    email: {
        type: Sequelize.STRING,
        allowNull: false
    },
    password: {
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
    }
},{
    sequelize,
    modelName:'User',
    freezeTableName:true,
    timestamps: true
    //options
});
//

// User.sync({force: true}).then(() => console.log('SUCCESS CREATE TABLE USER')).catch(err => console.log(err));

// // 创建关联增加数据
// User.sync({ force: true }).then(() => {
//     // Now the `users` table in the database corresponds to the model definition
//     return User.create({
//         name: 'Johsns',
//         email: 'Hancoscks@123',
//         password:'a11s2',
//     });
// });


module.exports =User;
