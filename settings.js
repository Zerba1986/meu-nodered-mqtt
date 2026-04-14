module.exports = {
    adminAuth: {
        type: "credentials",
        users: [{
            username: "admin",
            password: "$2b$08$H66TncVpqI.VshS8z5CH9uXp0Gqy9pGZpW.v8Yp8Vv9J.f9rP6S1.",
            permissions: "*"
        }]
    },
    httpNodeAuth: {
        user: "admin",
        pass: "$2b$08$H66TncVpqI.VshS8z5CH9uXp0Gqy9pGZpW.v8Yp8Vv9J.f9rP6S1."
    },
    ui: { path: "ui" },
    functionGlobalContext: { os:require('os') },
    exportGlobalContextKeys: false
}
