module.exports = {
    // Segurança do Editor (Onde você cria os fluxos)
    adminAuth: {
        type: "credentials",
        users: [{
            username: "admin",
            password: "$2b$08$H66TncVpqI.VshS8z5CH9uXp0Gqy9pGZpW.v8Yp8Vv9J.f9rP6S1.", // Hash para '1234'
            permissions: "*"
        }]
    },

    // Segurança do Dashboard (Onde fica o painel do ESP32)
    httpNodeAuth: {
        user: "admin",
        pass: "$2b$08$H66TncVpqI.VshS8z5CH9uXp0Gqy9pGZpW.v8Yp8Vv9J.f9rP6S1." // Hash para '1234'
    },

    // Garante que o Dashboard use a rota /ui
    ui: { path: "ui" },
    
    // Outras configurações padrão necessárias
    functionGlobalContext: { os:require('os') },
    exportGlobalContextKeys: false
}
