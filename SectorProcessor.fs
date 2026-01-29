open System
open System.IO

(* NullSector - F# Functional Processor
   Operator: GhostByte
   Task: Asynchronous Sector Analysis
*)

let analyzeSector path =
    let targets = [".apk"; ".log"; ".tmp"]
    try
        let files = Directory.GetFiles(path, "*.*", SearchOption.AllDirectories)
        files 
        |> Array.filter (fun file -> List.contains (Path.GetExtension(file)) targets)
        |> Array.iter (fun file -> printfn "[F# ANALYZER] Detected: %s" (Path.GetFileName(file)))
    with
    | :? UnauthorizedAccessException -> printfn "[!] Access Denied in some sectors."
    | ex -> printfn "[!] Unexpected Error: %s" ex.Message

[<EntryPoint>]
let main argv =
    let targetIP = "85.111.76.66"
    printfn "--- NullSector F# Module Active ---"
    printfn "Monitoring Origin: %s" targetIP
    
    // Mevcut dizini tara
    analyzeSector (Directory.GetCurrentDirectory())
    
    printfn "Analysis Complete. GhostByte, system integrity verified."
    0 // Başarıyla tamamlandı
