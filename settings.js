module.exports = {
    // Segurança do Editor (Onde você cria os fluxos)
    adminAuth: {
        type: "credentials",
        users: [{
            username: "admin",
            password: "$2b$08$2mS97G79vYvS.7VfGvMvA.9YfW5W8X6Z7Y8Z9A0B1C2D3E4F5G6H.", // Hash para '1234'
            permissions: "*"
        }]
    },

    // Segurança do Dashboard (Onde fica o painel do ESP32)
    httpNodeAuth: {
        user: "admin",
        pass: "$2b$08$2mS97G79vYvS.7VfGvMvA.9YfW5W8X6Z7Y8Z9A0B1C2D3E4F5G6H." // Hash para '1234'
    },

    // Garante que o Dashboard use a rota /ui
    ui: { path: "ui" },
    
    // Outras configurações padrão necessárias
    functionGlobalContext: { os:require('os') },
    exportGlobalContextKeys: false
}
