let g:vmuxclipboard_python_version=0
if has('python3')
    let g:vmuxclipboard_python_version=3
endif

let g:vmuxclipboard_path = "/" . join(split(fnamemodify(resolve(expand('<sfile>:p')), ':h'), "/")[:-2], "/") . '/py/vmux_clipboard.py'

function! WriteToVmuxClipboard()
    if g:vmuxclipboard_python_version == 3
python3 <<EOF
import sys
sys.argv = ['write']
EOF
        execute 'py3file ' . g:vmuxclipboard_path
    else
        echom "vmux-clipboard error: vim not compiled with python3"
        return
    endif
endfunction

function! ReadFromVmuxClipboard()
    if g:vmuxclipboard_python_version == 3
python3 <<EOF
import sys
sys.argv = ['read']
EOF
        execute 'py3file ' . g:vmuxclipboard_path
    else
        echom "vmux-clipboard error: vim not compiled with python3"
        return
    endif
endfunction

command WriteToVmuxClipboard call WriteToVmuxClipboard()
command ReadFromVmuxClipboard call ReadFromVmuxClipboard()
