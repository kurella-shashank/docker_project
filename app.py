import streamlit as st
import pandas as pd
import numpy as np

# Page title
st.title("📊 Sample Streamlit App")

# Text
st.write("This is a simple Streamlit demo.")

# Sidebar input
st.sidebar.header("User Input")
name = st.sidebar.text_input("Your name", "Alex")
age = st.sidebar.slider("Your age", 18, 100, 25)

st.write(f"Hello **{name}**, you are **{age}** years old.")

# Button interaction
if st.button("Generate random data"):
    data = pd.DataFrame(
        np.random.randn(20, 3),
        columns=["A", "B", "C"]
    )
    st.subheader("Random Data")
    st.dataframe(data)

    st.subheader("Line Chart")
    st.line_chart(data)

# Checkbox
if st.checkbox("Show raw numbers"):
    st.write("Here are some numbers:")
    st.write(np.random.randn(10))
