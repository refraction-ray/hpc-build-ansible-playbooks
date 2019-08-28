#!/bin/bash
MAIL=/usr/bin/mail

echo "$2"|$MAIL -s "$2" $3 -r {{ slurm_mail }}
