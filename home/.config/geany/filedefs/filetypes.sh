[build-menu]
FT_00_LB=Compile
FT_00_CM=python -m py_compile “%f”
FT_00_WD=
FT_02_LB=_Lint
FT_02_CM=flake8 –ignore=W291,W293 “%f” > estilo.txt
FT_02_WD=
EX_00_LB=_Execute
EX_00_CM=\spython “%f” python “%f”
EX_00_WD=
EX_01_LB=
EX_01_CM=
EX_01_WD=
