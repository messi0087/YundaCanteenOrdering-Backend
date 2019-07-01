//进行加密的方法
const bcrypt = require('bcryptjs');

const tools ={
    enbcrypt(password) {
        let salt = bcrypt.genSaltSync(10);
        return bcrypt.hashSync(password, salt);
    }
};

module.exports =tools;