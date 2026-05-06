{
  writeShellApplication,
}:

(writeShellApplication {
  name = "mommy"; # alias for `sudo`

  text = ''
    MAGIC_WORDS=("pls" "plz" "please" "pretty please")

    # stolen from https://github.com/Gankra/cargo-mommy/
    BAD=(
      "do you need mommy's help~?"
      "mommy knows her little boy can do better~"
      "try again for mommy, boy~"
      "do you think you're going to get a reward from mommy like that~?"
      "*grabs your hair and pulls your head back*\nyou can do better than that for mommy can't you~?"
      "if you don't learn how to code better, mommy is going to put you in time-out~"
      "does mommy need to give her little boy some special lessons~?"
      "you need to work harder to please mommy~"
      "are you just keysmashing now~?\ncute~"
      "*picks you up by the throat*\npathetic~"
      "*brandishes her paddle*\ndon't make me use this~"
      "whore.\nslut~\npet~~"
      "get on your knees and beg mommy for forgiveness you slut~"
      "does mommy need to put you in the whore wiggler~?"
      "mommy is starting to wonder if you should just give up and become her breeding stock~"
      "on your knees pervert~"
      "oh dear. mommy is not pleased"
      "brats like you don't get to talk to mommy"
    )

    GOOD=(
      "*pets your head*"
      "*gives you scritches*"
      "you're such a smart cookie~"
      "that's a good boy~"
      "mommy thinks her little boy earned a big hug~"
      "good boy so proud of you~"
      "aww, what a good boy~\nmommy knew you could do it~"
      "*tugs your leash*\nthat's a VERY good boy~"
      "*runs her fingers through your hair* good boy~ keep going~"
      "*smooches your forehead*\ngood job~"
      "*nibbles on your ear*\nthat's right~\nkeep going~"
      "keep it up and mommy might let you cum you little pervert~"
      "good boy~\nyou've earned five minutes with the buzzy wand~"
      "*slides her finger in your mouth*\nthat's a good little toy~"
      "you're so good with your fingers~\nmommy knows where her toy should put them next~"
      "that's a good slut~"
      "yes~\nyes~~\nyes~~~"
      "mommy's going to keep her good little whore~"
      "do you want mommy's milk?\nkeep this up and you'll earn it~"
      "oooh~ what a good toy you are~"
      "open wide slut.\nyou've earned mommy's milk~"
    )

    EMOJIS=(
      "🫦"
      "💋"
      "❤️"
      "💖"
      "💗"
      "💓"
      "💞"     
    )

    good_response() {
      echo -e "''${GOOD[''$(( RANDOM % ''${#GOOD[@]} ))]} ''${EMOJIS[''$(( RANDOM % ''${#EMOJIS[@]} ))]}" >&2
    }

    bad_response() {
      echo -e "''${BAD[''$(( RANDOM % ''${#BAD[@]} ))]} ''${EMOJIS[''$(( RANDOM % ''${#EMOJIS[@]} ))]}" >&2
    }

    if [[ $# -eq 0 ]]; then
      echo "usage: mommy pls <command>" >&2
      bad_response
      exit 1
    fi

    for word in "''${MAGIC_WORDS[@]}"; do
      if [[ "$1" == "$word" ]]; then
        shift
        good_response
        exec sudo "$@"
      fi
    done

    bad_response

    exit 1
  '';
})
