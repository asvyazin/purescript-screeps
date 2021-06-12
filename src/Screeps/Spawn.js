"use strict";

exports.spawnCreep = function (structure) {
    return function (parts) {
        return function (name) {
            return structure.spawnCreep(parts, name);
        };
    };
};

exports.spawnCreepOptsImpl = function (structure) {
    return function (parts) {
        return function (name) {
            return function (opts) {
                return structure.spawnCreep(parts, name, opts);
            };
        };
    };
};
