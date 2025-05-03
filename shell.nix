{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.ruby
    pkgs.bundler
    pkgs.nodePackages.sass
    pkgs.inotify-tools

  ];

  shellHook = ''
    # if ! gem list -i sass > /dev/null; then
    #   echo "Installing ruby-sass gem locally..."
    #   gem install sass --user-install
    # fi
    export PATH="$HOME/.gem/ruby/${pkgs.ruby.version}/bin:$PATH"
    echo "Run: sass-convert input.css output.scss"
  '';
}
