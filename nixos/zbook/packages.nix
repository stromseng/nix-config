{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #openjdk # For PlantUML
    #graphviz # For PlantUML
    #zotero # Citation manager
    #python3
    #burpsuite
    #sqlmap
    #steam
  ];
}
