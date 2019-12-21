# Prints information about the current context.
#
# Returns:
# name <context_name>
# cluster <context_cluster>
# namespace <context_namespace>
function kubectl_context () {

  # Exit if KUBECONFIG isn't set.
  [[ -z "$KUBECONFIG" ]] && return 1

  # Get our kubeconfigs.
  kubeconfigs=(${(ps_:_)KUBECONFIG})

  # Get our primary kubeconfig.
  kubeconfig=$kubeconfigs[1]

  # Grab our current context.
  context=$(grep current-context $kubeconfig | cut -f 2 -d ':' | tr -d '[:space:]' 2> /dev/null)

  # Exit if current-context isn't set.
  [[ -z "$context" ]] && return 1

  # kubeconfig contents.
  kubeconfig_contents=$(cat $kubeconfigs)
  # Grab content around `contexts:`.
  kubeconfig_contexts=$(echo $kubeconfig_contents | sed -n -e '/^contexts:/,/^[a-z]*:/p')
  # Remove non-context contents entries.
  kubeconfig_contexts=$(echo $kubeconfig_contexts | sed -e '/^[a-z-]*:/d')
  # Remove newlines.
  kubeconfig_contexts=$(echo $kubeconfig_contexts | tr '\n' ' ')
  # Split contexts onto separate lines (unique character hack for newline on OSX).
  kubeconfig_contexts=$(echo $kubeconfig_contexts | sed -e 's/- /,/g' | tr ',' '\n')
  # Eliminate extra whitespace.
  kubeconfig_contexts=$(echo $kubeconfig_contexts | sed -E -e 's/[[:space:]]+/ /g')
  # Grab the current context information.
  kubeconfig_contexts=$(echo $kubeconfig_contexts | grep -E "name: $context")
  # Expand the current context information onto multiple lines (OSX hack again).
  kubeconfig_contexts=$(echo $kubeconfig_contexts | sed -E 's/([a-z-]*):/,\1/g' | tr ',' '\n' )
  # Remove quotes and empty strings.
  kubeconfig_contexts=$(echo $kubeconfig_contexts | sed -E 's/"//g')

  # Store the results.
  context_info=$kubeconfig_contexts

  # Current namespace.
  namespace=$(echo $context_info | grep -E 'namespace ' | awk '{print $2}')
  # Current cluster.
  cluster=$(echo $context_info | grep -E 'cluster ' | awk '{print $2}')

  # Return values.
  echo "name $context"
  echo "namespace $namespace"
  echo "cluster $cluster"
}

# Default display configuration
KUBE_PS1_CONTEXT_ENABLED=false
KUBE_PS1_CLUSTER_ENABLED=true
KUBE_PS1_NS_ENABLED=true
KUBE_PS1_PREFIX="%{$fg_bold[blue]%}\u2388%{$reset_color%}"

function toggle_kube () {
  [[ ${KUBE_PS1_ENABLED} == 'true' ]] && KUBE_PS1_ENABLED=false && return
  KUBE_PS1_ENABLED=true
}

function toggle_kube_context () {
  [[ ${KUBE_PS1_CONTEXT_ENABLED} == 'true' ]] && KUBE_PS1_CONTEXT_ENABLED=false && return
  KUBE_PS1_CONTEXT_ENABLED=true
}

function toggle_kube_cluster () {
  [[ ${KUBE_PS1_CLUSTER_ENABLED} == 'true' ]] && KUBE_PS1_CLUSTER_ENABLED=false && return
  KUBE_PS1_CLUSTER_ENABLED=true
}

function toggle_kube_namespace () {
  [[ ${KUBE_PS1_NS_ENABLED} == 'true' ]] && KUBE_PS1_NS_ENABLED=false && return
  KUBE_PS1_NS_ENABLED=true
}

function kube_ps1 () {
  [[ ${KUBE_PS1_ENABLED} != 'true' ]] && return
  
  # Grab our kubectl data.
  kubectl_context=$(kubectl_context)

  # Grab our context name.
  context=$(echo "$kubectl_context" | grep -e 'name' | awk '{print $2}')
  # Grab our cluster name.
  cluster=$(echo "$kubectl_context" | grep -e 'cluster' | awk '{print $2}')
  # Grab our namespace.
  namespace=$(echo "$kubectl_context" | grep -e 'namespace' | awk '{print $2}')

  # Style our data.
  prefix="$KUBE_PS1_PREFIX"
  color_delimiter="%{$fg_bold[yellow]%}: %{$reset_color%}"
  [[ ! -z "$context" ]] && color_context="%{$fg_bold[blue]%}$context%{$reset_color%}"
  [[ ! -z "$cluster" ]] && color_cluster="%{$fg_bold[blue]%}$cluster%{$reset_color%}"
  [[ ! -z "$namespace" ]] && color_namespace="%{$fg_bold[blue]%}$namespace%{$reset_color%}" || color_namespace="%{$fg_bold[blue]%}default%{$reset_color%}"

  # Print the data we have available.
  [[ ! -z "$cluster$namespace" ]] && echo -n " $prefix "
  
  [[ ${KUBE_PS1_CONTEXT_ENABLED} == 'true' ]] \
  && [[ ! -z "$context" ]] && echo -n "(" \
  && [[ ! -z "$context" ]] && echo -n "$color_context" \
  && [[ ! -z "$context" ]] && echo -n ") " \

  [[ ${KUBE_PS1_CLUSTER_ENABLED} == 'true' ]] \
  && [[ ! -z "$cluster" ]] && echo -n "$color_cluster" \
  && echo -n "$color_delimiter";

  [[ ${KUBE_PS1_NS_ENABLED} == 'true' ]] \
  && [[ ! -z "$cluster" ]] && echo -n "$color_namespace" \
  && echo -n "";

}