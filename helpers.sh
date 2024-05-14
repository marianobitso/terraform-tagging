BITSO_FINOPS_ACCOUNTS=( preview-environments sandbox dev stage prod)

find_overrides_with_content () {
	find . -name 'override.tf' -type f | while read -r file
	do
		if grep -q 'provider "aws"' "$file"
		then
			echo $file
		fi
	done
}

find_by_env () {
  local BITSO_FINOPS_ACCOUNTS=( preview-environments dev stage sandbox prod )
	for env in "${BITSO_FINOPS_ACCOUNTS[@]}"
	do
		find . -name "$env.tfvars" -type f | while read -r file
		do
			echo $file
		done
	done
}
