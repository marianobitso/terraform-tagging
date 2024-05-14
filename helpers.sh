FINOPS_STAGES=( preview-environments sandbox dev stage prod)

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
	for env in "${FINOPS_STAGES[@]}"
	do
		find . -name "$env.tfvars" -type f | while read -r file
		do
			echo $file
		done
	done
}
