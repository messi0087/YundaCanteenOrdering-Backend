const JwtStrategy = require('passport-jwt').Strategy,
    ExtractJwt = require('passport-jwt').ExtractJwt;
//引入 配置文件
const config =require('../config/default');
//引入 User模型
const User = require('../models/User');

const opts = {};
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = config.secretOrKey;

//监听
module.exports = passport =>{
    passport.use(
        new JwtStrategy(opts,async function(jwt_payload, done) {
            // console.log(jwt_payload)
            //进行查询
            const user =await User.findAll({
                where: { id: jwt_payload.id }
            });

            if (user){
                return done(null,user);
            }else {
                return done(null,false)
            }
    }));
};
