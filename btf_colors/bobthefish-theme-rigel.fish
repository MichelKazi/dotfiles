
function bobthefish_colors -S -d 'Custom theme to reflect Rigel color pallette'

	set -l base03  002b36
	set -l base02  004752
	set -l base01  586e75
	set -l base00  657b83
	set -l base0   e3f8ff
	set -l base1   e1f5f5
	set -l base2   e6dab5
	set -l base3   fdf6e3
	set -l yellow  f7a100
	set -l orange  cb4b16
	set -l red     ff0000
	set -l magenta d33682
	set -l violet  6c71c4
	set -l blue    268bd2
	set -l cyan    2aa198
	set -l green   00ff55

	set colorfg $base3

	set -x color_initial_segment_exit     $base2 $red --bold
	set -x color_initial_segment_su       $base2 $green --bold
	set -x color_initial_segment_jobs     $base2 $blue --bold

	set -x color_path                     $base02 $base0
	set -x color_path_basename            $base02 $base1 --bold
	set -x color_path_nowrite             $base02 $orange
	set -x color_path_nowrite_basename    $base02 $orange --bold

	set -x color_repo                     $green 000000 --bold
	set -x color_repo_work_tree           $base02 000000 
	set -x color_repo_dirty               $red 000000 --bold
	set -x color_repo_staged              $yellow 000000 --bold

	set -x color_vi_mode_default          $blue $colorfg --bold
	set -x color_vi_mode_insert           $green $colorfg --bold
	set -x color_vi_mode_visual           $yellow $colorfg --bold

	set -x color_vagrant                  $violet $colorfg --bold
	set -x color_k8s                      $green $colorfg --bold
	set -x color_username                 $base02 $blue --bold
	set -x color_hostname                 $base02 $blue
	set -x color_rvm                      $red $colorfg --bold
	set -x color_nvm                      $green $colorfg --bold
	set -x color_virtualfish              $cyan $colorfg --bold
	set -x color_virtualgo                $cyan $colorfg --bold
	set -x color_desk                     $cyan $colorfg --bold
	set -x color_nix                      $cyan $colorfg --bold

end
