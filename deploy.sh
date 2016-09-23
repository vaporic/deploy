#!/bin/sh
# Autor : Hugo Espinosa <vaporic@gmail.com>
DIR_REPO="repo"
SERVER_REPO=/var/www

config() {
    echo "LOG: configurando..."
    cd $DIR_REPO
    # TODO: Validar que no exista dir
    mkdir $HOME"/"$DIR_REPO"/"$repo_input".git"
    cd $HOME"/"$DIR_REPO"/"$repo_input".git"
    git init --bare
    cd hooks
    touch post-receive
    echo "#!/bin/sh" >> post-receive
    echo "git --work-tree=$SERVER_REPO/$repo_input --git-dir=$HOME/$DIR_REPO/$repo_input.git checkout -f" >> post-receive
    chmod +x post-receive
    mkdir $SERVER_REPO/$repo_input
    echo "LOG: Configuración terminada para agregar el nuevo remote ingresa algo similar a esto en tu repo local:"
    echo "git remote add live ssh://$USER@$(hostname -f)$HOME/repo/$repo_input.git"
    echo "NOTE: Para subir cambios ejecuta desde tu repo local:"
    echo "git push live master"
    exit
}

echo "Ingresa el nombre del repositorio: "

read repo_input

if [ -z "$repo_input" ]; then
   echo "Ingresa el nombre (no vacio) del repositorio ejecuta de nuevo el script :)"
   exit
else
    if [ -d ~/"$DIR_REPO" ]; then
        config
    else
        mkdir ~/$DIR_REPO
        echo "LOG: Se creo la carpeta ~/$DIR_REPO"
        config
    fi
fi
