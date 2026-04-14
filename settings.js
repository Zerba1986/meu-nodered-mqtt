module.exports = {
    adminAuth: {
        type: "credentials",
        users: [{
            username: "seu_usuario",
            password: "$2a$12$pUFCt/vFF3N.yjdrlWAPU.UlNvQdJqQYYCZaZwSRiy.vxuLyHGVfC", // Ex: $2b$08$....
            permissions: "*"
        }]
    },
    httpNodeAuth: {
        user: "admin_dash",
        pass: "$2a$12$pUFCt/vFF3N.yjdrlWAPU.UlNvQdJqQYYCZaZwSRiy.vxuLyHGVfC"
    },
    ui: { path: "ui" }
}
