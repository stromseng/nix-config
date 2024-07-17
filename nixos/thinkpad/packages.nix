{pkgs, ...} : {
  environment.systemPackages = with pkgs; [
    gnome.gnome-boxes
    openjdk # For PlantUML
    graphviz # For PlantUML
    zotero # Citation manager
    distrobox # Linux containers manager
    boxbuddy # Distrobox gui
    python3
    burpsuite
    sqlmap
    steam
  ];
}