module.exports = {
    adminAuth: {
        type: "credentials",
        users: [{
            username: "admin",
            password: "$2a$12$pUFCt/vFF3N.yjdrlWAPU.UlNvQdJqQYYCZaZwSRiy.vxuLyHGVfC",
            permissions: "*"
        }]
    },
    httpNodeAuth: {
        user: "admin",
        pass: "$2a$12$pUFCt/vFF3N.yjdrlWAPU.UlNvQdJqQYYCZaZwSRiy.vxuLyHGVfC"
    },
    ui: { path: "ui" },
    functionGlobalContext: { os:require('os') },
    exportGlobalContextKeys: false
}
