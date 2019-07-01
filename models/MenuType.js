const Sequelize = require('sequelize');
const Model =Sequelize.Model;
const sequelize = require('../config-db/db');


//实例化数据模板
class MenuType extends Model{}


MenuType.init({
    // attributes
    menuTypeid:{
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
    modelName:'MenuType',
    freezeTableName:true,
    timestamps: false
    //options
});

module.exports =MenuType;
