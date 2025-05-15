
# PYTHON SETUP
export PYENV_ROOT=/disk1/pyenv
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"

## DATASET SETUP
export BRIEFLOW_OUTPUT_PATH="/disk1/brieflow_datasets/aconcagua"
export CONFIG_PATH="$BRIEFLOW_OUTPUT_PATH/config.yaml"
export SCREEN_PATH="$BRIEFLOW_OUTPUT_PATH/screen.yaml"

## APP SETUP
export STREAMLIT_SERVER_BASE_URL_PATH="/aconcagua"

# RUN APP
cd visualization
exec python -m streamlit run Experimental_Overview.py --server.address=0.0.0.0 --server.port=8501 "$@"

