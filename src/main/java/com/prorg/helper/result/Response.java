package com.prorg.helper.result;

import java.util.ArrayList;
import java.util.List;

public class Response<T> {
    private T result;

    private List<String> errors;

    private Response(T result, List<String> errors) {
        this.result = result;
        this.errors = errors;
    }

    public static <T> Response Success(T result) {
        return new Response<>(result, new ArrayList<>());
    }

    public static Response Failure(List<String> errors) {
        return new Response<>(null, errors);
    }

    public boolean isSuccessful() {
        return errors.isEmpty();
    }

    public T data() throws Exception {
        if (result == null)
            throw new Exception("Save failed, no serial id");
        return result;
    }

    public List<String> errors() {
        return errors;
    }
}