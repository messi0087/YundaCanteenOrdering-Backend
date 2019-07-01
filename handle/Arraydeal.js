const Arraydeal=(array)=>{
        var arr = array;

        var obj = {};
        arr = arr.reduce(function (item, next) {
            obj[next.menuTypeid] ? '' : obj[next.menuTypeid] = item.push(next);
            return item;
        }, []);
       return arr;
};

module.exports =Arraydeal;

