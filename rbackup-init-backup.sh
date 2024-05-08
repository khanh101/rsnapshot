new_backup_dir=`date +'%Y-%m-%d_%H-%M-%S'`

# Create new backup directory, or exit if fail
mkdir $new_backup_dir
if [ $? -ne 0 ]; then exit 1; fi

# Remove the old "latest" and "previous", and create new ones
if [ -e previous ]; then rm previous; fi
if [ -e latest ]; then
  prev_backup_dir=`ls -l latest | grep -o "[0-9]\{4\}-[0-9]\+-[0-9]\+_[0-9_-]\+"`
  rm latest
else
  prev_backup_dir=$new_backup_dir
fi
ln -s $prev_backup_dir previous
ln -s $new_backup_dir latest