if (env | grep -Fq 'DISTROBOX'); then
  POSTNAME=$CONTAINER_ID
else
  POSTNAME=`hostname -s`
fi
if echo $POSTNAME | egrep -q '^a'; then
  PS_HOST="\[\e[01;38;5;28m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^b'; then
  PS_HOST="\[\e[01;38;5;45m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^c'; then
  PS_HOST="\[\e[01;38;5;60m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^d'; then
  PS_HOST="\[\e[01;38;5;76m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^e'; then
  PS_HOST="\[\e[01;38;5;112m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^f'; then
  PS_HOST="\[\e[01;38;5;124m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^g'; then
  PS_HOST="\[\e[01;38;5;130m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^h'; then
  PS_HOST="\[\e[01;38;5;154m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^i'; then
  PS_HOST="\[\e[01;38;5;159m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^j'; then
  PS_HOST="\[\e[01;38;5;147m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^k'; then
  PS_HOST="\[\e[01;38;5;178m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^l'; then
  PS_HOST="\[\e[01;38;5;199m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^m'; then
  PS_HOST="\[\e[01;38;5;204m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^n'; then
  PS_HOST="\[\e[01;38;5;213m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^o'; then
  PS_HOST="\[\e[01;38;5;246m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^p'; then
  PS_HOST="\[\e[01;38;5;96m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^q'; then
  PS_HOST="\[\e[01;38;5;100m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^r'; then
  PS_HOST="\[\e[01;38;5;65m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^s'; then
  PS_HOST="\[\e[01;38;5;88m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^t'; then
  PS_HOST="\[\e[01;38;5;105m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^u'; then
  PS_HOST="\[\e[01;38;5;118m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^v'; then
  PS_HOST="\[\e[01;38;5;132m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^w'; then
  PS_HOST="\[\e[01;38;5;141m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^x'; then
  PS_HOST="\[\e[01;38;5;219m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^y'; then
  PS_HOST="\[\e[01;38;5;165m\]${POSTNAME}"
elif echo $POSTNAME | egrep -q '^z'; then
  PS_HOST="\[\e[01;38;5;171m\]${POSTNAME}"
fi
#PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]${POSTNAME}:\[\033[33;1m\]\w\[\033[m\]\$ "
