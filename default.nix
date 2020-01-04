{ nixpkgs, declInput }:
let 
  pkgs = import nixpkgs {};
  helloJson = builtins.readFile ./jobsets/hello.json;
in {
  jobsets = pkgs.runCommand "spec.json" {} ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > $out <<EOF
    ${helloJson}
    EOF
  '';
}