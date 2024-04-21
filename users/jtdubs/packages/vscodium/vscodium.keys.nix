{ ... }:
{
  programs.vscode.keybindings = [
    {
      "key" = "ctrl+o";
      "command" = "workbench.action.gotoSymbol";
    }
    {
      "key" = "ctrl+h";
      "command" = "workbench.action.toggleSidebarVisibility";
    }
    {
      "key" = "ctrl+j";
      "command" = "workbench.action.terminal.focus";
    }
    {
      "key" = "ctrl+shift+j";
      "command" = "workbench.action.terminal.toggleTerminal";
    }
    {
      "key" = "ctrl+k ctrl+k";
      "command" = "workbench.action.focusLastEditorGroup";
    }
    {
      "key" = "ctrl+p ctrl+n";
      "command" = "editor.action.marker.next";
      "when" = "editorFocus";
    }
    {
      "key" = "ctrl+p ctrl+p";
      "command" = "editor.action.marker.prev";
      "when" = "editorFocus";
    }
    {
      "key" = "ctrl+p ctrl+shift+n";
      "command" = "editor.action.marker.nextInFiles";
      "when" = "editorFocus";
    }
    {
      "key" = "ctrl+p ctrl+shift+p";
      "command" = "editor.action.marker.prevInFiles";
      "when" = "editorFocus";
    }
  ];
}
