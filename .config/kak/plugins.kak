source "%val{config}/bundle/kak-bundle/rc/kak-bundle.kak"
bundle-noload kak-bundle https://git.sr.ht/~jdugan6240/kak-bundle

bundle fzf.kak 'https://github.com/andreyorst/fzf.kak' %{
    map global normal <c-p> ': fzf-mode<ret>'
}

bundle kak-lsp 'ln -sf /usr/share/kak-lsp/' %{
    hook global WinSetOption filetype=(rust|zig|c|cpp|lua) %{
        lsp-enable-window
    }
    hook global WinSetOption filetype=(rust|zig) %{
        hook window BufWritePre .* lsp-formatting-sync
    }

    map global user l %{:enter-user-mode lsp<ret>} -docstring "LSP mode"
}

bundle kakoune-buffers 'https://github.com/Delapouite/kakoune-buffers' %{
  map global user b ': enter-buffers-mode<ret>' -docstring 'buffers'
  map global user B ': enter-user-mode -lock buffers<ret>' -docstring 'buffers (lock)'
}

bundle kakoune-phantom-selection 'https://github.com/occivink/kakoune-phantom-selection' %{
    map global user f ": phantom-selection-add-selection<ret>" -docstring "phantom sel/add"
    map global user F ": phantom-selection-select-all; phantom-selection-clear<ret>" -docstring "phantom sel/select"
    map global user n ": phantom-selection-iterate-next<ret>" -docstring "phantom sel/next"
    map global user p ": phantom-selection-iterate-prev<ret>" -docstring "phantom sel/prev"
}
