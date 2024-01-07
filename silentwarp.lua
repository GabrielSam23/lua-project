script_name("desembaralha")
script_version("07.01.2024")

local sampev = require 'lib.samp.events'

-- Lista de palavras embaralhadas e suas correspondentes
local listaDePalavras = {
    ["CUIEVOL"] = "veículo",
    ["CORAR"] = "carro",
    ["PMAA"] = "mapa",
    ["LARAVPA"] = "palavra",
    ["TANGIA"] = "antiga",
    ["HOLAF"] = "folha",
    ["EIIOQRSU"] = "isqueiro",
    ["CLADOTE"] = "teclado",
    ["DACNORE"] = "caderno",
    ["NVNOREI"] = "inverno",
    ["onieover"] = "nevoeiro",
    ["EXTTO"] = "texto",
    ["LTSAO"] = "salto",
}

function desembaralharPalavra(palavraEmbaralhada)
    print("Palavra desembar: " .. palavraEmbaralhada)

    -- Verifique se a palavra desembaralhada está na lista
    for palavraEmbaralhadaLista, palavraCorrespondente in pairs(listaDePalavras) do
        if palavraEmbaralhadaLista:lower() == palavraEmbaralhada:lower() then
            print("Encontrado na lista! Desembaralhando...")
            
            -- Adicione aqui a lógica para enviar o comando desejado
            local comando = "/desem " .. palavraCorrespondente
            print("LIGACAO DIRETA EM 3 segundos", comando, 3000)
            sampSendChat(comando)

            break  -- Sai do loop assim que encontrar uma correspondência
        end
    end
end

function sampev.onShowTextDraw(id, data)
    if id == 87 then  -- Verifique se é o textdraw desejado
        local _, _, palavraEmbaralhada = data.text:find("~r~(%a+)~w~ tem ~g~%d+~w~ segundos")

        if palavraEmbaralhada then
            desembaralharPalavra(palavraEmbaralhada)
        end
    end
end
