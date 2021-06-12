"use strict";

exports.spawnCreep = function (structure) {
    return function (parts) {
        return function (name) {
            return function () {
                return structure.spawnCreep(parts, name);
            };
        };
    };
};

exports.spawnCreepOptsImpl = function (structure) {
    return function (parts) {
        return function (name) {
            return function (opts) {
                return function () {
                    return structure.spawnCreep(parts, name, opts);
                };
            };
        };
    };
};
